import os

def combine_txt_files_with_sql_blocks(directory, output_file):
    # SQL block to disable constraints
    sql_block_start = """
BEGIN
   FOR fk IN (SELECT constraint_name, table_name
                FROM user_constraints
               WHERE constraint_type = 'R'
                 AND status = 'ENABLED')
   LOOP
      EXECUTE IMMEDIATE 'ALTER TABLE ' || fk.table_name || ' DISABLE CONSTRAINT ' || fk.constraint_name;
   END LOOP;
END;
"""
    
    # SQL block to enable constraints
    sql_block_end = """
BEGIN
   FOR fk IN (SELECT constraint_name, table_name
                FROM user_constraints
               WHERE constraint_type = 'R'
                 AND status = 'DISABLED')
   LOOP
      EXECUTE IMMEDIATE 'ALTER TABLE ' || fk.table_name || ' ENABLE CONSTRAINT ' || fk.constraint_name;
   END LOOP;
END;
"""
    
    # Open the output file in write mode
    with open(output_file, 'w', encoding='utf-8') as outfile:
        # Write the starting SQL block to the output file
        outfile.write(sql_block_start + "\n")
        
        # Loop through all files in the specified directory
        for filename in os.listdir(directory):
            # Check if the file is a .txt file
            if filename.endswith('.txt'):
                # Write the file name in the specified format to the output file
                outfile.write(f"--Daten für Table {filename}\n")
                # Open the .txt file and read its contents
                with open(os.path.join(directory, filename), 'r', encoding='utf-8') as infile:
                    content = infile.read()
                    # Write the contents of the .txt file to the output file
                    outfile.write(content)
                    # Add the separator after the file content
                    outfile.write("commit;\n\n")
        
        # Write the ending SQL block to the output file
        outfile.write(sql_block_end)

# Specify the directory containing the .txt files and the output file name
input_directory = r"C:\Users\raydi\Desktop\test_data_first_try\files to combine"  # Use raw string to avoid issues with backslashes
output_filename = r"C:\Users\raydi\Desktop\test_data_first_try\combine.txt"

# Call the function to combine the files with SQL blocks
combine_txt_files_with_sql_blocks(input_directory, output_filename)

print(f"All .txt files in {input_directory} have been combined into {output_filename} with the specified SQL blocks.")
