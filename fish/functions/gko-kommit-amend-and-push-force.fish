function gko-kommit-amend-and-push-force
  git commit --amend --no-edit;
  git push -f origin master;
end
