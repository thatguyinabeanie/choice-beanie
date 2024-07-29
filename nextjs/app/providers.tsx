"use client";

import * as React from "react";
import { NextUIProvider } from "@nextui-org/system";
import { useRouter } from "next/navigation";
import { ThemeProvider as NextThemesProvider } from "next-themes";
import { ThemeProviderProps } from "next-themes/dist/types";
import ChildrenProps from "@/types/childrenProps";

export interface ProvidersProps extends ChildrenProps {
  themeProps?: ThemeProviderProps;
}

export function Providers ({ children, themeProps }: Readonly<ProvidersProps>) {
  const router = useRouter();

  return (
    <NextUIProvider navigate={ router.push }>
      <NextThemesProvider { ...themeProps }>{ children }</NextThemesProvider>
    </NextUIProvider>
  );
}
