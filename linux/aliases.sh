alias grep='grep --color'
alias memproc='ps -ax --no-headers --format=pid,rss,command --sort=-rss,pid | head -20 | awk '\''BEGIN{suffixes_len=split("kB MB GB TB",suffixes)} {n_suffix=1; while($2 > 1000 && n_suffix < suffixes_len) {$2 /= 1024; n_suffix++;}; printf "%5s %7.2f %2s %s\n",$1,$2,suffixes[n_suffix],substr($0, index($0,$3))}'\'' | grep '\''[[:digit:]]\+\.[[:digit:]]\+ MB'\'''
