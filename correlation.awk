# correlation.awk: Calculates the Pearson correlation coefficient.
# Input: A tab-separated file.
# Output: Prints the Pearson correlation coefficient formatted to three decimal places.

# Process each data row, skipping the header
NR > 1 && $column_x != "" && $column_y != "" {
    x[NR] = $column_x
    y[NR] = $column_y
    n++
    sum_x += $column_x
    sum_y += $column_y
    sum_x2 += $column_x^2
    sum_y2 += $column_y^2
    sum_xy += $column_x * $column_y
}
END {
    if (n == 0) {
        print "undefined: missing or empty values in both columns"
        exit
    }

    # Calculate Pearson correlation coefficient components
    numerator = sum_xy - (sum_x * sum_y)/n
    denominator_x = sqrt(sum_x2 - (sum_x^2)/n)
    denominator_y = sqrt(sum_y2 - (sum_y^2)/n)

    # Check for zero variance in either variable (denominator would be zero)
    if (denominator_x == 0 || denominator_y == 0) {
        print "undefined: one or both variables have zero variance"
        exit
    }
    correlation = numerator / (denominator_x * denominator_y)
    printf "%.3f\n", correlation
}