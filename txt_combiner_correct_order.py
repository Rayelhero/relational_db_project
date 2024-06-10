import os

def combine_txt_files_with_sql_blocks(directory, output_file):
    
    # Define the order of the files to be processed
    file_order = [
        "Person",
        "Eventkategorie",
        "Kunde",
        "mitarbeiter",
        "technik",
        "arbeitsschritt",
        "band",
        "buchung",
        "location",
        "ressource_mitarbeiter",
        "ressource_technik",
        "buchungsposition",
        "event",
        "bewertung",
        "einsatz",
        "event_band",
        "ticket"
    ]

    # Open the output file in write mode
    with open(output_file, 'w', encoding='utf-8') as outfile:
        
        # Loop through the files in the specified order
        for base_filename in file_order:
            # Construct the full filename with .txt extension
            filename = base_filename + '.txt'
            # Check if the file exists in the directory
            full_path = os.path.join(directory, filename)
            if os.path.exists(full_path):
                # Write the file name in the specified format to the output file
                outfile.write(f"--Daten für Table {filename}\n")
                # Open the .txt file and read its contents
                with open(full_path, 'r', encoding='utf-8') as infile:
                    content = infile.read()
                    # Write the contents of the .txt file to the output file
                    outfile.write(content)
                    # Add the separator after the file content
                    outfile.write("commit;\n\n")
            else:
                print(f"Warning: {filename} not found in {directory}")

# Specify the directory containing the .txt files and the output file name
input_directory = r"C:\Users\raydi\Desktop\test_data_first_try\files to combine"  # Use raw string to avoid issues with backslashes
output_filename = r"C:\Users\raydi\Desktop\test_data_first_try\output.txt"

# Call the function to combine the files with SQL blocks
combine_txt_files_with_sql_blocks(input_directory, output_filename)

print(f"All .txt files in {input_directory} have been combined into {output_filename} in the specified order with the SQL blocks.")
