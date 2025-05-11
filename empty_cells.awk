BEGIN{
    print "test start"
}

NR == 1 {
    for (i = 1; i <= NF; i++){
        header_field[i] = $i
        empty_count[i] = 0
    }
}

NR > 1 {
    for (i = 1; i <= NF; i++){
        if($i == ""){
            empty_count[i]++
        } 
    }

}

END{
    print "ending....."
    for (i = 1; i <= NF; i++){
        print header_field[i] ": " empty_count[i]
    }
}
