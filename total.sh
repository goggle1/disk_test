wk -F " " 'BEGIN{total=0} {total+=$2} END{print total}' frag.log
