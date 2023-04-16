ffmpeg -i $1 -vf "drawtext=text='   $3':fontcolor='White'" -c:a copy $2
