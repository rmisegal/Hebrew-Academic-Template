"""Master script to generate all images for image_example.tex"""
import os
import subprocess
import sys

# Get the directory of this script
script_dir = os.path.dirname(os.path.abspath(__file__))
os.chdir(script_dir)

scripts = [
    'generate_basic_figure.py',
    'generate_architecture.py',
    'generate_data_graph.py',
    'generate_directed_graph.py',
    'generate_sidebyside.py',
    'generate_grid.py',
    'generate_subfigures.py',
    'generate_position_examples.py',
    'generate_hebrewfigure.py',
    'generate_detailed_caption.py',
]

print("=" * 50)
print("Generating all images for image_example.tex")
print("=" * 50)

for script in scripts:
    print(f"\nRunning {script}...")
    try:
        subprocess.run([sys.executable, script], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error running {script}: {e}")

print("\n" + "=" * 50)
print("All images generated!")
print("=" * 50)
