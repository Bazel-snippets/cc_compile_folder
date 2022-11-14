# buildifier: disable=module-docstring
load("any_transition.bzl", "any_transition")

def _impl(ctx):
    tree_artifact = ctx.actions.declare_directory(ctx.attr.name)
    ctx.actions.run_shell(
        inputs = [],
        outputs = [tree_artifact],
        arguments = [tree_artifact.path],
        progress_message = "Generating files into '%s'" % tree_artifact.path,
        command = 'cd {} && echo "unsigned int func() {{ return 42; }}" > tree_artifact.cpp'.format(tree_artifact.path),
    )
    return [DefaultInfo(files=depset([tree_artifact]))]

create_tree_artifact = rule(
    implementation = _impl,
    attrs = {
        "_allowlist_function_transition": attr.label(
            default = "@bazel_tools//tools/allowlists/function_transition_allowlist",
        ),
    },
    cfg = any_transition,
)