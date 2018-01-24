#!/usr/bin/bash

cat ${2} | sed \
    -e "s/ESPA_VERSION/${1}/" \
    -e "s/ESPA_PRODUCT_FORMATTER/product_formatter_v1.13.2.b/" \
    -e "s/ESPA_L2QA_TOOLS/l2qa_tools_v1.6.0/" \
    -e "s/ESPA_SURFACE_REFLECTANCE/surface_reflectance_sept2017/" \
    -e "s/ESPA_SURFACE_TEMPERATURE/st-rit-v1.0.0/" \
    -e "s/ESPA_SPECTRAL_INDICES/spectral_indices_v2.6.0/" \
    -e "s/ESPA_SURFACE_WATER_EXTENT/espa-v2.25.0/" \
    -e "s/ESPA_ELEVATION/v2.3.1/" \
    -e "s/ESPA_REPROJECTION/v1.0.2/" \
    -e "s/ESPA_PLOTTING/v0.1.0/" \
    -e "s/ESPA_PYTHON_LIBRARY/v1.1.0/" \
    -e "s/ESPA_PROCESSING/v2.25.0/" > ${3}
