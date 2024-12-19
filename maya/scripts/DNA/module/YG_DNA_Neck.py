
from os import makedirs
from os import path as ospath

ROOT_DIR = "Z:/VindictusGFX/Content/tool/maya/scripts/DNA"
OUTPUT_DIR = f"{ROOT_DIR}/output"

CHARACTER_DNA = ""
OUTPUT_DNA = "" 

import dnacalib as dnacalib
import dna

def load_dna(dna_path: str):
    # Load the DNA
    stream = dna.FileStream(dna_path, dna.FileStream.AccessMode_Read, dna.FileStream.OpenMode_Binary)
    reader = dna.BinaryStreamReader(stream, dna.DataLayer_All)
    reader.read()
    return reader

def save_dna(reader: dnacalib.DNACalibDNAReader, created_dna_path: str):
    # Saves the dna
    stream = dna.FileStream(created_dna_path, dna.FileStream.AccessMode_Write, dna.FileStream.OpenMode_Binary)
    writer = dna.BinaryStreamWriter(stream)
    writer.setFrom(reader)
    writer.write()

def get_joints(dna):
    joints = []
    for jointIndex in range(dna.getJointCount()):
        joints.append(dna.getJointName(jointIndex))
    return joints

def serchjointName(input_path):
    dna = load_dna(input_path)
    myJoint = get_joints(dna)

    myNeckJoint = []
    for i in myJoint:
        if "FACIAL" in i and "Neck" in i:
            myNeckJoint.append(i)
        if "FACIAL" in i and "Adams" in i:
            myNeckJoint.append(i)
    # print(myNeckJoint)
    return myNeckJoint

def calibrate_dna(input_path, output_path):
    print('lod DNA : ', input_path)
    print('neck DNA : ', output_path)

    dna = load_dna(input_path)
    calibrated = dnacalib.DNACalibDNAReader(dna)

    print("Saving DNA...")
    save_dna(calibrated, output_path)

    while len(serchjointName(output_path)) > 0:
        dna = load_dna(output_path)
        calibrated = dnacalib.DNACalibDNAReader(dna)

        for i in range(dna.getJointCount()):
            joint_name = calibrated.getJointName(i)

            if "FACIAL" in joint_name and "Neck" in joint_name:
                print (i, joint_name)
                command = dnacalib.RemoveJointCommand(i)
                command.run(calibrated)

            if "FACIAL" in joint_name and "Adams" in joint_name:
                print (i, joint_name)
                command = dnacalib.RemoveJointCommand(i)
                command.run(calibrated)

        print("Saving DNA...")
        save_dna(calibrated, output_path)

    print("Done.")


def deleteNeckJoint():
    makedirs(OUTPUT_DIR, exist_ok=True)
    calibrate_dna(CHARACTER_DNA, OUTPUT_DNA)
