# Remember last dir

function __onprompt --on-event fish_prompt
  echo (pwd) > ~/.cwd
end
