import { execSync } from "child_process";

const packages = [
  "brace-expansion",
  "ip-address",
  "pacote",
  "sigstore",
  "@sigstore/core",
  "picomatch",
  "minimatch",
];

for (const pkg of packages) {
  try {
    const result = execSync(`npm ls ${pkg} --depth=0`, { encoding: "utf-8" });
    console.log(`\n=== ${pkg} ===`);
    console.log(result);
  } catch (e) {
    console.log(`${pkg}: not installed or error - ${e.message}`);
  }
}
