/**
 * 脚本运行git命令
 */
const { exec, execSync } = require("child_process")
const path = require("path")

function removeEmptyLines(string) {
  return string.replace(/[\s\r\n]+$/, '')
}
/**
 *脚本运行git命令
 *
 * @param {string|undefined} gitWorkTree：
 * @param {string} command：
 * @param {(err: Error | null, output: string))=>void} callback：
 * @return {*} 
 */
exports.runGitCommand = (gitWorkTree, command, callback) => {
  const gitCommand = gitWorkTree
    ? ['git', `--git-dir=${path.join(gitWorkTree, '.git')}`, `--work-tree=${gitWorkTree}`, command].join(' ')
    : ['git', command].join(' ')

  if (callback) {
    exec(gitCommand, (err, stdout) => {
      if (err) {
        return callback(err, '')
      }
      callback(null, removeEmptyLines(stdout))
    })

    return null
  }
  return removeEmptyLines(`${execSync(gitCommand)}`)

}

console.log(runGitCommand('./', "log -1 --format=%cI"));