# buildifier: disable=module-docstring
def _any_impl(settings, attr):
    return {
        "//command_line_option:platforms": [":any"],
    }

any_transition = transition(
    implementation = _any_impl,
    inputs = [],
    outputs = [
        "//command_line_option:platforms",
    ],
)