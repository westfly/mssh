user="adwl"
ipdata="$1"
shift 1
deploy_ip="/tmp/ip.dat"
awk '{if ($0 !~/^#/)print $1}' $ipdata > $deploy_ip
argument=$*
echo $argument
function pssh_login()
{
    local deploy=$1
    local user=$2
    local passwd=$3
    shift 3
    content=$(python bin/pssh -t -1 -l $user -h $deploy -C $passwd -x "-o StrictHostKeyChecking=no" -i "$*")
    me=$(echo $content |grep FAILURE |wc -l)
    if [[ $me -gt 0 ]]; then
        return -1
    fi
    python bin/pssh -t -1 -l $user -h $deploy -C $passwd -x "-o StrictHostKeyChecking=no" -i "$*"
    return 0;
}
user_list="adwl"
password_list="adwl2015"
for user in ${user_list[*]}
do
    for passwd in ${password_list[*]}
    do
        pssh_login $deploy_ip $user $passwd $argument
        if [[ $? -eq 0 ]]; then
            exit
        fi
    done
done
