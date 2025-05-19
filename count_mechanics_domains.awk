# count_mechanics_domains.awk: Identifies and counts the occurrences of game mechanics
#                              and game domains from input file.
# Input: A tab-separated file, Assumes 'Mechanics' are in column 13 and 'Domains' are in column 14.
# Output: Prints the result to standard output.

# Process the header row to find column positions
NR == 1 {
    for (i=1; i<=NF; i++) {
        if ($i == "Mechanics") mechanics_column = i
        if ($i == "Domains") domain_column = i
    }
}

# Process all data rows that have mechanics data
NR > 1 && $mechanics_column != "" {
    split($mechanics_column, mechanics, /, /)
    # Count each unique mechanic
    for (m in mechanics) {
        if (mechanics[m] != "") {
            mechanics_counts[mechanics[m]]++
        }
    }
}

# Process all data rows that have domain data
NR > 1 && $domain_column != "" {
    split($domain_column, domains, /, /)
    # Count each unique domain
    for (d in domains) {
        if (domains[d] != "") {
            domain_counts[domains[d]]++
        }
    }
}

END {
    max_mechanic = ""; max_mechanic_count = 0
    # Find the mechanic with highest count
    for (m in mechanics_counts) {
        if (mechanics_counts[m] > max_mechanic_count) {
            max_mechanic = m
            max_mechanic_count = mechanics_counts[m]
        }
    }
    
    max_domain = ""; max_domain_count = 0
    # Find the domain with highest count
    for (d in domain_counts) {
        if (domain_counts[d] > max_domain_count) {
            max_domain = d
            max_domain_count = domain_counts[d]
        }
    }
    
    print "The most popular game mechanics is", max_mechanic, "found in", max_mechanic_count, "games"
    print "The most popular game domain is", max_domain, "found in", max_domain_count, "games"
}