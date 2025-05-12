NR == 1 {
    # Assign the header with its name, and initialise empty_count array
    for (i = 1; i <= NF; i++){
        header_field[i] = $i
        empty_count[i] = 0
    }
}

# Start counting empty field from second row
NR > 1 {
    for (i = 1; i <= NF; i++){
        if($i == ""){
            empty_count[i]++
        } 
    }

}

END{
    # Print the results
    for (i = 1; i <= NF; i++){
        print header_field[i] ": " empty_count[i]
    }
}