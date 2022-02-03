function row --argument index --description "Take a single row from input"
    sed -n "$index p"
end
