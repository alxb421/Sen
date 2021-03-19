TTFDIR="./TTFs"
rm -r $TTFDIR/*.ttf

fontmake -g ./Glyphs/sen.glyphs -o ttf -i --output-dir $TTFDIR -a

for f in $TTFDIR/*.ttf
do
	~/.local/bin/gftools fix-dsig --autofix $f
	~/.local/bin/gftools fix-hinting $f
	mv $f.fix $f
done

# # Clean up
rm -r instance_ufo
rm -r master_ufo
