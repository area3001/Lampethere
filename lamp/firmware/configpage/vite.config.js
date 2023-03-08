import { defineConfig } from "vite";
import { viteSingleFile } from "vite-plugin-singlefile";
import { ViteMinifyPlugin } from "vite-plugin-minify";

import fs from "fs";
import { dirname, join } from "path";
import { createGzip } from "zlib";

// Based on rollup-plugin-brotli
// https://github.com/keithamus/rollup-plugin-brotli
function compressFile(file, options, minSize) {
  return new Promise((resolve) => {
    fs.stat(file, (err, stats) => {
      if (err) {
        console.error("vite-plugin-gzip: Error reading file " + file);
        resolve();
        return;
      }

      if (minSize && minSize > stats.size) {
        resolve();
      } else {
        fs.createReadStream(file)
          .pipe(createGzip(options))
          .pipe(fs.createWriteStream(file + ".gz"))
          .on("close", () => resolve());
      }
    });
  });
}

function gzip(options = {}) {
  let _dir = "";
  options = Object.assign(
    {
      test: /\.(js|css|html|txt|xml|json|svg|ico|ttf|otf|eot)$/,
      additional: [],
      minSize: 0,
      options: {},
    },
    options
  );
  return {
    name: "brotli",
    generateBundle: (buildOpts) => {
      _dir = (buildOpts.file && dirname(buildOpts.file)) || buildOpts.dir || "";
    },
    writeBundle: async (outputOptions, bundle) => {
      const compressCollection = [];
      const bundlesToCompress = Object.keys(bundle)
        .filter((id) => options.test.test(bundle[id].fileName))
        .map((id) => bundle[id].fileName);
      const files = [
        ...options.additional,
        ...bundlesToCompress.map((f) => join(_dir, f)),
      ];
      for (const file of files) {
        compressCollection.push(
          compressFile(file, options.options, options.minSize)
        );
      }
      await Promise.all(compressCollection);
    },
  };
}

export default defineConfig({
  plugins: [viteSingleFile(), ViteMinifyPlugin(), gzip()],
});
