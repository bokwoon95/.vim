function gak-Add-kommit-amend-and-push-force
  git add -A;
  git commit --amend --no-edit;
  git push -f origin master;
end

