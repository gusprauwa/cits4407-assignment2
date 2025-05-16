BEGIN{
    max_mechanic = ""
    max_mechanic_count = 0
    max_domain = ""
    max_domain_count = 0
}

END {
   
    print "The most popular game mechanics is", max_mechanic, "found in", max_mechanic_count, "games"
    print "The most popular game domain is", max_domain, "found in", max_domain_count, "games"
}