#!/bin/bash
echo "Give me a filename with extension! And I say what is it!"
read filename
case "$filename" in
        (*.jpg|*.gif|*.png)
                echo "This is an IMAGE!"
        ;;
        *.mp3|*.wav)
                echo "This is an AUDIO!"
        ;;
        *.txt|*.doc)
                echo "This is a TEXT!"
        ;;
        *)
                echo "I don't know what is that!:)"
        ;;
esac
