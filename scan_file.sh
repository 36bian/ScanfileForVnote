# 写入临时文件
write_file(){
cat <<EOF >>temp.txt
        {
            "attachment_folder": "",
            "attachments": [
            ],
			"created_time": "`date +%Y-%m-%dT%H:%M:%SZ`",
			"modified_time": "`date +%Y-%m-%dT%H:%M:%SZ`",
			"name": "$1",
            "tags": [
            ]
        },
EOF
}
# 扫描缺失文件
scan_file(){
	count=0
	# 如果目录包含md文件
	if [[  `ls *md` ]]; then
		# 扫描缺失的文件写到临时文件
		for file_name in *md ; do
			# 中括号加个反斜杠
			grep_file_name=${file_name/'['/'\['}
			# grep 对比文件名是否存在文件中
			grep -q ${grep_file_name} _vnote.json
			# 如果不存在则插入json
			if [[ $? -ne 0 ]]; then
				write_file $file_name
				count=$[$count+1]
			fi
		done
		# 检测到临时文件则写入json
		if [ -f "temp.txt" ]; then
  			sed -i '' '3 r temp.txt' _vnote.json
  			rm temp.txt
  			pwd >> $output_dir
  			# 结果输出
			echo 扫描到缺失文件数：$count >> $output_dir
		fi
	fi
}
scan_dir(){
	# 定义主目录
	target_dir="/Users/Admin/Dropbox/vnotebook的副本"
	output_dir="/Users/Admin/Dropbox/result.txt"

	echo "====扫描开始====" >> $output_dir
	for sub_dir in `find $target_dir -type d`; do
		cd $sub_dir
		scan_file
	done
	echo "====扫描结束====" >> $output_dir
}

scan_dir