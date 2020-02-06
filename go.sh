
function read_dir(){
dir=$1

if [ "${dir##*.}"x = "apk"x ];then
   tmp=${dir##*/}
   file=${tmp%.*}
   path=$(dirname $dir)

   echo "do_apktool"
   apktool d -s -f $dir -o $path"/"$file

   echo "do_dex2jar"
   sh ./dex2jar-2.0/d2j-dex2jar.sh  $path"/"$file"/"classes.dex -o $path"/"$file"/"classes-dex2jar.jar  --force


   echo "do_JD_GUI" 
   project_path=$(cd `dirname $0`; pwd)
   open -a $project_path/jd-gui-osx-1.4.1/JD-GUI.app/ $path"/"$file"/"classes-dex2jar.jar

   echo "success out:" $path"/"$file
else
   echo "Error : 输入apk文件地址"
fi
} 



#读取第一个参数
read_dir $1