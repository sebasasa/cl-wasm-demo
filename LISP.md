

I create this microlisp in python with the help of AI. Maybe there is a use for this?

```python
import operator as op

def tokenize(code): return code.replace('(', ' ( ').replace(')', ' ) ').split()

def parse(tokens):
    for token in tokens:
        if token == '(': yield list(parse(tokens))
        elif token == ')': return
        else: yield token

# These are the symbols and expresiosn we have availiable as build-in
env = {
    '+': op.add, '-': op.sub, '*': op.mul, '/': op.truediv,
    '>': op.gt, '<': op.lt, '==': op.eq,
    'print': lambda *args: print(*args) or args[-1]
}

# Here, on the other hand, are the keywords that control structure directly
def eval_ast(node):
    if not isinstance(node, list): 
        if node.replace('.', '', 1).isdigit(): return float(node)
        return env[node]
    
    # --- Special Forms ---
    if node[0] == 'begin': return [eval_ast(x) for x in node[1:]][-1] # Runs all lines, returns last
    if node[0] == 'if': return eval_ast(node[2]) if eval_ast(node[1]) else eval_ast(node[3])
    if node[0] == 'define': env[node[1]] = eval_ast(node[2]); return env[node[1]]
    if node[0] == 'lambda': return lambda *args: eval_ast(node[2]) if (env.update(dict(zip(node[1], args))) or True) else None

    func, *args = [eval_ast(x) for x in node]
    return func(*args)
```

We can run a program like this

```python
lisp_file_content = """
(begin
    (define pi 3.14159)
    (print pi)

    (define countdown 
        (lambda (n) 
            (if (> n 0) 
                (countdown (- n (print n 1))) 
                (print 0))))

    (countdown 3)
)
"""

# Parse and evaluate the entire script file in one single shot!
ast = next(parse(iter(tokenize(lisp_file_content))))
eval_ast(ast)

```


Hey! Check this javascript version! 

```js
const op = {
    '+': (a, b) => a + b, '-': (a, b) => a - b, '*': (a, b) => a * b, '/': (a, b) => a / b,
    '>': (a, b) => a > b, '<': (a, b) => a < b, '==': (a, b) => a === b,
    'print': (...args) => { console.log(...args); return args[args.length - 1]; }
};

const tokenize = (code) => code.replace(/\(/g, ' ( ').replace(/\)/g, ' ) ').trim().split(/\s+/);

function* parse(tokens) {
    while (tokens.length > 0) {
        let token = tokens.shift();
        if (token === '(') yield Array.from(parse(tokens));
        else if (token === ')') return;
        else yield token;
    }
}

const env = { ...op };

const evalAst = (node) => {
    if (!Array.isArray(node)) return !isNaN(node) && !isNaN(parseFloat(node)) ? parseFloat(node) : env[node];
    
    if (node[0] === 'begin') return node.slice(1).map(evalAst).pop();
    if (node[0] === 'if') return evalAst(node[1]) ? evalAst(node[2]) : evalAst(node[3]);
    if (node[0] === 'define') return env[node[1]] = evalAst(node[2]);
    if (node[0] === 'lambda') return (...args) => (node[1].forEach((p, i) => env[p] = args[i]), evalAst(node[2]));

    const [func, ...args] = node.map(evalAst);
    return func(...args);
};

//Example 

const lispFileContent = `
(begin
    (define pi 3.14159)
    (print pi)

    (define countdown 
        (lambda (n) 
            (if (> n 0) 
                (countdown (- n (print n 1))) 
                (print 0))))

    (countdown 3)
)
`;

const tokens = tokenize(lispFileContent);
const ast = parse(tokens).next().value;
evalAst(ast);
```


I feel like this could be a phenomenal pairing for my creative coding language 
Like you do NOT have a lisp at hand? Craft yourself one! 
