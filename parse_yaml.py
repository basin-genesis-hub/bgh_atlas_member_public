import yaml
import sys
import glob, os

def get_yaml(f):
  pointer = f.tell()
  if f.readline() != '---\n':
    f.seek(pointer)
    return ''
  readline = iter(f.readline, '')
  readline = iter(readline.__next__, '---\n')
  return ''.join(readline)

def main():
  path = os.getcwd()
  print('path', path)

  filelist = []
  public_posts = []
  private_posts = []

  for file in glob.glob(path + "/_posts/*.md"):
    filelist.append(file)
  for filename in filelist:
    # print('filename:', filename)
    with open(filename) as f:
      config = yaml.load(get_yaml(f), Loader = yaml.FullLoader)
      text = f.read()
      # print(config['privacy'])
      if config['privacy'] == 'public':
        public_posts.append(os.path.basename(filename))
      else:
        private_posts.append(os.path.basename(filename))

  print('public', public_posts)


  with open('public_posts.txt', 'w') as f:
    for item in public_posts:
        f.write("_posts/%s " % item)

  print('private', private_posts)
  
  with open('private_posts.txt', 'w') as f:
    for item in private_posts:
        f.write("_posts/%s " % item)

if __name__ == '__main__': main()