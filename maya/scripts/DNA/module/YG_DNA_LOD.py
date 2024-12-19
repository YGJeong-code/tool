
from os import makedirs
from os import path as ospath

# if you use Maya, use absolute path
# ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")
# ROOT_DIR = "C:/dna_calibration"
ROOT_DIR = "Z:/VindictusGFX/Content/tool/maya/scripts/DNA"

OUTPUT_DIR = f"{ROOT_DIR}/output"

import dnacalib as dnacalib
import dna

"""
"""
CHARACTER = "Lethita01" 
"""
"""

# Sets DNA file path
# DNA = f"{ROOT_DIR}/data/dna_files/Ada.dna"
DNA = f"{OUTPUT_DIR}/{CHARACTER}_calib_modified.dna"

# Sets new DNA output file path
DNA_NEW = f"{OUTPUT_DIR}/{CHARACTER}_lod.dna"

# Sets lods to extract
# LODS = [1, 3, 4, 6]
LODS = [1, 6]


def save_dna(reader: dnacalib.DNACalibDNAReader, created_dna_path: str):
    # Saves the dna
    stream = dna.FileStream(created_dna_path, dna.FileStream.AccessMode_Write, dna.FileStream.OpenMode_Binary)
    writer = dna.BinaryStreamWriter(stream)
    writer.setFrom(reader)
    writer.write()


def run_SetLODsCommand(reader):
    calibrated = dnacalib.DNACalibDNAReader(reader)
    command = dnacalib.SetLODsCommand()
    # Set a list of LODs that will be exported to the new file
    command.setLODs(LODS)
    # Runs the command that reduces LODs of the DNA
    command.run(calibrated)
    print("Setting new LODs...")

    # if calibrated.getLODCount() != 2:
    #     raise RuntimeError("Setting new number of LODs in DNA was unsuccessful!")

    print("\nSuccessfully changed number of LODs in DNA.")
    print("Saving DNA...")
    # Save the newly created DNA
    save_dna(calibrated, DNA_NEW)
    print("Done.")
    

def load_dna_calib(dna_path: str):
    # Load the DNA
    stream = dna.FileStream(dna_path, dna.FileStream.AccessMode_Read, dna.FileStream.OpenMode_Binary)
    reader = dna.BinaryStreamReader(stream, dna.DataLayer_All)
    reader.read()
    return reader

def makeLOD():
    print(DNA)
    print(DNA_NEW)

    makedirs(OUTPUT_DIR, exist_ok=True)
    reader = load_dna_calib(DNA)  
    run_SetLODsCommand(reader)
