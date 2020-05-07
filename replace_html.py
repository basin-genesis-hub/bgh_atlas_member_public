import glob, os

fin = open('auth_template.html', "rt")
data = fin.read()

for file in glob.glob("**/*.html", recursive=True):
    if file == 'auth_template.html':
        continue
    print(file)
    data_new = data.replace('MMMM-path-placeholder', '_site/'+file)
    fout = open(file, "wt")
    fout.write(data_new)
    fout.close()

