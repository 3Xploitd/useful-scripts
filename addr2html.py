import sys

def addr2html(file, num_columns):
    file = open(file, 'r').readlines()
    html_table = '<html>\n  <table>\n    <tr>\n      <th>Target Hosts</th>\n    </tr>\n'
    count = 0
    tr_spacing = ' ' * 4
    td_spacing = ' ' * 6
    for item in file:
        item = item.strip()
        if count == 0:
            html_table += tr_spacing + '<tr>\n'
        html_table += td_spacing + '<td>' + item + '</td>\n'
        count += 1
        if (item == file[-1].strip()) and (count != num_columns):
            html_table += tr_spacing + '</tr>\n'
        if count == num_columns:
            html_table += tr_spacing + '</tr>\n'
            count = 0
    html_table += '  </table>\n</html>'
    print(html_table)

if __name__ == '__main__':
    file = sys.argv[1]
    num_columns = int(sys.argv[2])
    addr2html(file, num_columns)
