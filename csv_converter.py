import csv
import os

def generate_insert_statements(csv_file_path, table_name):
    # Open the CSV file
    with open(csv_file_path, mode='r', encoding='utf-8') as csvfile:
        # Read the CSV file
        csv_reader = csv.reader(csvfile)
        
        # Extract the header (first row) which contains column names
        columns = next(csv_reader)
        
        # Initialize a list to store the insert statements
        insert_statements = []
        
        # Loop through each row in the CSV file
        for row in csv_reader:
            # Handle NULL values, escaping, and quotes
            values = []
            for value in row:
                if value == "":
                    values.append("NULL")
                else:
                    # Escape single quotes by doubling them
                    escaped_value = value.replace("'", "''")
                    values.append(f"'{escaped_value}'")
            
            # Create the SQL insert statement
            columns_str = ", ".join(columns)
            values_str = ", ".join(values)
            insert_statement = f"INSERT INTO {table_name} ({columns_str}) VALUES ({values_str});"
            
            # Add the statement to the list
            insert_statements.append(insert_statement)
    
    return insert_statements

def save_statements_to_file(statements, csv_file_path):
    # Get the base name of the CSV file without the extension
    base_name = os.path.splitext(os.path.basename(csv_file_path))[0]
    # Get the directory of the CSV file
    directory = os.path.dirname(csv_file_path)
    # Create the output file path with .txt extension
    output_file_path = os.path.join(directory, f"{base_name}.txt")
    
    # Write the statements to the file
    with open(output_file_path, mode='w', encoding='utf-8') as file:
        for statement in statements:
            file.write(statement + "\n")
    
    print(f"SQL statements saved to {output_file_path}")

# Example usage:
csv_file_path = r'C:\Users\raydi\Desktop\test_data_first_try\csv_files\technik.csv'  # Use raw string (r'') for Windows paths
table_name = 'TECHNIK'
insert_statements = generate_insert_statements(csv_file_path, table_name)

# Save the generated statements to a text file
save_statements_to_file(insert_statements, csv_file_path)
