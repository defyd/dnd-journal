import os

def main():
    for imagename in os.listdir("_notes/_staging/Attachments"):
        print(imagename)
        with open(os.path.join("_notes/_staging/Attachments", imagename), 'rb') as image:
            with open("Attachments/" + imagename, 'wb') as newimage:
                newimage.write(image.read())
                





if __name__ == "__main__":
    main()