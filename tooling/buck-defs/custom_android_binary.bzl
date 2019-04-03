
def custom_android_binary(
    name,
    **kwargs
    ):

  # Create the android bundle rule as well

  native.android_binary(
    name=name,
    **kwargs
  )

  bundle_name = "bundle_debug" if "debug" in name else "bundle_release"
  native.android_bundle(
    name=bundle_name,
    **kwargs
  )
