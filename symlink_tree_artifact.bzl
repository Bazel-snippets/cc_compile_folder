# buildifier: disable=module-docstring
def _impl(ctx):
    source_file = ctx.file.src
    new_name = ctx.label.name

    # print('source_file = %s, new_name = %s' % (source_file, new_name))
    new_symlink = ctx.actions.declare_directory(new_name)
    ctx.actions.symlink(output = new_symlink, target_file = source_file)  # https://docs.bazel.build/versions/master/skylark/lib/actions.html#symlink

    # print('Created symlink from %s to %s' % (new_symlink, source_file.path))
    return [DefaultInfo(files = depset([new_symlink]))]

symlink_tree_artifact = rule(
    implementation = _impl,
    attrs = {
        "src": attr.label(allow_single_file = True),
    },
)
