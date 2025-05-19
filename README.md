# CITS4407 Assignment 2

**Course:** CITS4407 - Open Source Tools and Scripting
**Semester:** SEM-1 2025
---

### Main Shell Scripts

1.  **`empty_cells`**
    *   **Purpose:** This script scans a given text file (representing a spreadsheet, e.g., `bgg_dataset.txt`) and reports the number of empty cells found in each column. It uses the first line of the file as column headers.
    *   **Usage:** `./empty_cells <input_file> <separator_character>`
    *   **Example:** `./empty_cells bgg_dataset.txt ';'`
    *   **Dependencies:** Calls `empty_cells.awk` to perform the counting.

2.  **`preprocess`**
    *   **Purpose:** This script takes an input data file, performs several cleaning and transformation operations, and outputs the cleaned data to standard output.
    *   **Usage:** `./preprocess <input_file> > <output_cleaned_file.tsv>`
    *   **Example:** `./preprocess bgg_dataset.txt > bgg_dataset_cleaned.tsv`
    *   **Dependencies:** Calls `preprocess.awk` for the core cleaning logic.

3.  **`analysis`**
    *   **Purpose:** This script takes a cleaned, tab-separated data file (the output of `preprocess`) and performs the analysis required to answer the research questions.
    *   **Usage:** `./analysis <cleaned_input_file.tsv>`
    *   **Example:** `./analysis bgg_dataset_cleaned.tsv`
    *   **Dependencies:** Calls `count_mechanics_domains.awk` and `correlation.awk`.

---
### AWK Scripts

These AWK scripts contain the specific logic for data processing tasks and are invoked by the main shell scripts:

*   **`empty_cells.awk`**:
    *   Called by `empty_cells`.
    *   Reads the input file line by line, using the provided separator.
    *   Counts empty fields for each column identified in the header row.

*   **`preprocess.awk`**:
    *   Called by `preprocess`.
    *   Implements the data cleaning rules: changes separator to tab, handles ID generation for empty IDs, converts float formats, and prepares data for output. Non-ASCII characters are handled by the shell script (`tr`) before piping to this AWK script.

*   **`count_mechanics_domains.awk`**:
    *   Called by `analysis`.
    *   Parses the 'Mechanics' and 'Domains' columns (which may contain comma-separated lists of items).
    *   Counts the occurrences of each unique mechanic and domain across all games.

*   **`correlation.awk`**:
    *   Called by `analysis`.
    *   Calculates the Pearson correlation coefficient between two specified numerical columns.

---
## Setup and Execution

1.  **Ensure scripts are executable:**
    Before running, make the main shell scripts executable:
    ```bash
    chmod +x empty_cells preprocess analysis
    ```

2.  **Example Workflow:**

    a.  **Inspect data for empty cells** , using a single character as the separator:
        ```
        ./empty_cells bgg_dataset.txt ';'
        ```

    b.  **Preprocess the data** to clean it and convert it to a tab-separated format:
        ```
        ./preprocess bgg_dataset.txt
        ```

    c.  **Run the analysis** on the cleaned dataset:
        ```
        ./analysis bgg_dataset_cleaned.tsv
        ```
        

---

