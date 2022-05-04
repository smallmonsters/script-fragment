: << EOF
  TODO 1：通过命令而不是文件的形式
  TODO 2：可以通过--help来查看common
  实现vscode备份功能
  TODO 1：复制配置文件到指定目录----------------------------------done
  TODO 2：指定目录可以通过用户指定
  TODO 3：自动上传git仓库
  TODO 4：git仓库/指定目录来自于，配置文件
  TODO 5：实现一个定义任务，每隔一个时间，自动备份
  实现vscode导入
  TODO 1：重指定目录导入配置----------------------------------done
  TODO 2：指定目录可以通过用户指定
  TODO 3：自动从git仓库下载
  TODO 4：git仓库/指定目录来自于，配置文件
  issues 1：vscode插件 settings async 从哪获取的插件配置
EOF

backup_path=""$HOME"/vscode-backup"
backup_snippets="$backup_path/snippets"
config_path="$HOME/Library/Application Support/Code/User"

# 备份功能

# 检测备份的文件夹是否存在
if [ ! -d $backup_path ]
then
  mkdir $backup_path
fi
# TODO： 一定要cd一下吗？
cd $HOME/.vscode/ && zip -qr $HOME/vscode-backup/vscode.zip ./extensions; # 备份插件
cp "$config_path/keybindings.json" $backup_path; # 备份快捷键
cp "$config_path/settings.json" $backup_path; # 备份设置
# 检测snippets文件是否存在
if [ -d "$config_path"/snippets ];then
  if [ ! -d $backup_snippets ]; then
    mkdir $backup_snippets;
  fi
  cp -r "$config_path"/snippets/* $HOME/vscode-backup/snippets; # 备份代码片段
fi





# 导入功能

# 检测导入的文件夹是否存在
# if [ ! -d $backup_path ]
# then
#   echo "$backup_path 不存在"
#   exit;
# fi

# unzip -qo $HOME/vscode-backup/vscode.zip -d $HOME/.vscode; # 备份插件
# cp "$backup_path/keybindings.json" "$config_path" ; # 导入快捷键
# cp "$backup_path/settings.json" "$config_path"; # 导入设置

# # 检测snippets文件是否存在
# if [ -d  $backup_snippets ]; then
#   if [ ! -d "$config_path"/snippets ]
#   then
#     mkdir  "$config_path"/snippets
#   fi
#   cp -r $HOME/vscode-backup/snippets/* "$config_path"/snippets ; # 导入代码片段
# fi