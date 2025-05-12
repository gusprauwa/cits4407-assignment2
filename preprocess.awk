BEGIN {
    # Change field separator to tab
    FS = ";";   
    OFS = "\t"; 
}

{
    # Give empty id field a new value based on previous max + 1
    if ($1 == "") {
        max_id++
        $1 = max_id; # 'max_id' is passed via -v from shell
    }

    # Change format of floating-point numbers (',' to '.') using regex
    for (i = 1; i <= NF; i++) {
        if ($i ~ /^[0-9]+,[0-9]+$/) {
            gsub(/,/, ".", $i)
        }
    }

    # Make changes at least to one field, so that all the field rebuild with new tab separator
    $1 = $1;
    print;
}