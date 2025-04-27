import base64

def encode_file_to_base64(input_file, output_file):
    """Read a Python file, encode its content to Base64, and write the encoded content to a new file."""
    with open(input_file, 'rb') as f:
        code = f.read()
    
    encoded_code = base64.b64encode(code).decode('utf-8')
    
    with open(output_file, 'w') as f:
        f.write(f"""
import base64
import sys

encoded_code = \"\"\"{encoded_code}\"\"\"
decoded_code = base64.b64decode(encoded_code).decode('utf-8')

exec(decoded_code)
""")

if __name__ == "__main__":
    input_file = 'le nom de ton fichier .py '
    output_file = 'ficher obf.py'
    encode_file_to_base64(input_file, output_file)
    print(f"Encoded code written to {output_file}")
