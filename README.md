### What's in the lite archives

Zero byte the MP3 files

    find magento-sample-data-1.9.0.0 -name '*.mp3' | while read F; do >$F; done

Remove the cache/tmp dirs

    rm -rf magento-sample-data-1.9.0.0/media/tmp magento-sample-data-1.9.0.0/media/catalog/product/cache

Resize the large images to a tenth their size

    for EXT in jpg png; do
      find magento-sample-data-1.9.0.0 -size +500k -name '*.'$EXT | while read F; do convert $F -resize 10% $F.new; mv $F{.new,} ; done
    done

Losslessly recompress the image files using MageStack utils

    /microcloud/scripts_ro/image_optimise.sh magento-sample-data-1.9.0.0

