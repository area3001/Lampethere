import { defineConfig } from "vite";
import { viteSingleFile } from "vite-plugin-singlefile";
import { ViteMinifyPlugin } from "vite-plugin-minify";
import brotli from "rollup-plugin-brotli";

export default defineConfig({
  plugins: [viteSingleFile(), ViteMinifyPlugin(), brotli()],
});
