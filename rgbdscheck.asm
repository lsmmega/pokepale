IF !DEF(__RGBDS_MAJOR__) || !DEF(__RGBDS_MINOR__) || !DEF(__RGBDS_PATCH__)
	fail "pokepale requires rgbds v0.9.2 or newer."
ENDC
IF __RGBDS_MAJOR__ == 0 && (__RGBDS_MINOR__ < 9 || (__RGBDS_MINOR__ == 9 && __RGBDS_PATCH__ < 2))
	fail "pokepale requires rgbds v0.9.2 or newer."
ENDC
