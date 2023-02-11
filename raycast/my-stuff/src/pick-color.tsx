import { environment, Clipboard, closeMainWindow, showHUD } from "@raycast/api";
import { execa } from "execa";
import { chmodSync } from "fs";
import { join } from "path";

export type RGB = Record<"r" | "g" | "b", number>;

export async function pickColor() {
  // Launch the binary with the correct permissions
  console.log(environment.supportPath);
  const command = join(environment.assetsPath, "color-picker");
  chmodSync(command, 0o755);

  try {
    // Parse the output from the binary
    const { stdout } = await execa(command);
    return JSON.parse(stdout) as RGB;
  } catch (error) {
    if (typeof error === "object" && error !== null && "stdout" in error && error.stdout === "No color selected")
      return undefined;
    else throw error;
  }
}

export function toHex(rgb: RGB) {
  const { r, g, b } = rgb;
  const [intR, intG, intB] = [r, g, b].map((c) => Math.round(c));
  return `#${intR.toString(16)}${intG.toString(16)}${intB.toString(16)}`;
}

export default async function command() {
  await closeMainWindow();

  try {
    const pickedColor = await pickColor();
    if (!pickedColor) return;

    const color = toHex(pickedColor);
    await Clipboard.copy(color);
    await showHUD(`✅ Copied ${color} to clipboard!`);
  } catch (e) {
    console.error(e);
    await showHUD("❌ Failed picking color");
  }
}
