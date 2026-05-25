/**
 * sketch-loader.js
 * Parses quicle.manifest.json to resolve a modular layout, or falls back 
 * completely to 'sketch/sketch.lisp' if no manifest is provided.
 */
async function bootstrapWeclApp() {
    const manifestName = 'quicle.manifest.json';
    let pipeline = [];

    try {
        // 1. Attempt to grab the Quicle manifest
        const manifestResponse = await fetch(manifestName);
        
        if (manifestResponse.ok) {
            // CASE A: Manifest exists! Parse it out.
            const manifest = await manifestResponse.json();
            
            const targetDir = manifest.dir ? manifest.dir : 'sketch';
            const localFiles = manifest.files || [];
            const entrypoint = manifest.entrypoint || 'sketch.lisp';
            
            pipeline = [
                'lib/engine.lisp',
                'lib/library.lisp',
                ...localFiles.map(file => `${targetDir}/${file}`),
                `${targetDir}/${entrypoint}`,
                'lib/bootstrap.lisp'
            ];
        } else {
            // CASE B: No manifest file. Fallback cleanly to the default single file setup.
            pipeline = [
                'lib/engine.lisp',
                'lib/library.lisp',
                'sketch/sketch.lisp',
                'lib/bootstrap.lisp'
            ];
        }

        // 2. Fetch all resolved source files concurrently
        const responses = await Promise.all(pipeline.map(file => fetch(file)));
        
        // 3. Verify everything in our pipeline was served successfully
        for (const response of responses) {
            if (!response.ok) {
                throw new Error(`Failed to load pipeline asset: ${response.url}`);
            }
        }
        
        const texts = await Promise.all(responses.map(res => res.text()));
        const unifiedCode = texts.join('\n\n');
        
        // 4. Ingest the single unified block into the DOM
        const scriptEl = document.createElement('script');
        scriptEl.type = 'text/common-lisp';
        scriptEl.text = unifiedCode;
        document.body.appendChild(scriptEl);
        
    } catch (err) {
        // Fallback error catcher with your explicit prompt suggestion
        console.error(err);
        console.warn(`%c👉 You probably forgot to define / update your manifest file [${manifestName}]`, "font-weight: bold; color: #ff4545; font-size: 12px;");
    }
}

// Ignition
bootstrapWeclApp();
