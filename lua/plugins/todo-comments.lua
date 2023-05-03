local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
  vim.notify("todo-comments not found!")
  return
end

todo_comments.setup()
