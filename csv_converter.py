import csv
import os
import glob

def generate_insert_statements(csv_file_path, table_name):
    with open(csv_file_path, mode='r', encoding='utf-8') as csvfile:
        csv_reader = csv.reader(csvfile)
        columns = next(csv_reader)
        insert_statements = []

        for row in csv_reader:
            values = []
            for value in row:
                if value == "":
                    values.append("NULL")
                else:
                    escaped_value = value.replace("'", "''")
                    values.append(f"'{escaped_value}'")
            
            columns_str = ", ".join(columns)
            values_str = ", ".join(values)
            insert_statement = f"INSERT INTO {table_name} ({columns_str}) VALUES ({values_str});"
            insert_statements.append(insert_statement)

    return insert_statements

def save_statements_to_file(statements, output_file_path):
    with open(output_file_path, mode='w', encoding='utf-8') as file:
        for statement in statements:
            file.write(statement + "\n")
    print(f"SQL statements saved to {output_file_path}")

def process_csv_files_in_directory(directory_path):
    csv_files = glob.glob(os.path.join(directory_path, "*.csv"))

    for csv_file in csv_files:
        base_name = os.path.splitext(os.path.basename(csv_file))[0]
        table_name = base_name.upper()  # Using upper case for table names as common practice in Oracle
        print(f"Processing file: {csv_file} for table: {table_name}")
        
        insert_statements = generate_insert_statements(csv_file, table_name)
        output_file_path = os.path.join(directory_path, f"{base_name}.txt")
        
        save_statements_to_file(insert_statements, output_file_path)

# Example usage:
directory_path = r'C:\Users\raydi\Desktop\test_data_first_try\new_script_test'  # Use raw string (r'') for Windows paths
process_csv_files_in_directory(directory_path)
