# buildifier: disable=module-docstring
load("any_transition.bzl", "any_transition")

def _impl(ctx):
    generated_source = ctx.actions.declare_file(ctx.attr.name + ".cpp")
    ctx.actions.run_shell(
        inputs = [],
        outputs = [generated_source],
        arguments = [generated_source.path],
        progress_message = "Generating file '%s'" % generated_source.path,
        command = 'echo "unsigned int func() {{ return 42; }}" > {}'.format(generated_source.path),
    )
    return [DefaultInfo(files=depset([generated_source]))]

generate_source = rule(
    implementation = _impl,
    attrs = {
        "_allowlist_function_transition": attr.label(
            default = "@bazel_tools//tools/allowlists/function_transition_allowlist",
        ),
    },
    cfg = any_transition,
)