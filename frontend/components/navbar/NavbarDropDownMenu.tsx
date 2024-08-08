"use client";

import {
  Dropdown,
  DropdownTrigger,
  DropdownMenu,
  DropdownItem,
  Avatar,
  Link,
} from "@nextui-org/react";
import * as React from "react";

import { siteConfig } from "@/config/site";

const avatarSrc = "/images/avatars/avatar-1.jpg";

const signedInMenuItems = () => {
  return [
    <DropdownItem key="profile" className="h-14 gap-2">
      <p>Signed in as</p>
      <p className="font-semibold">zoey@example.com</p>
    </DropdownItem>,
    ...siteConfig.navMenuItems.map((item) => (
      <DropdownItem key={item.label}>
        <Link href={item.href}>{item.label}</Link>
      </DropdownItem>
    )),
    <DropdownItem key="logout" color="danger">
      Log Out
    </DropdownItem>,
  ];
};
const NavbarDropDownMenu = () => {
  const isSignedIn = true;

  const menuItems = isSignedIn ? (
    signedInMenuItems()
  ) : (
    <DropdownItem>
      <Link href="/login">Log In</Link>
    </DropdownItem>
  );

  return (
    <Dropdown placement="bottom-end">
      <DropdownTrigger>
        <Avatar
          isBordered
          showFallback
          as="button"
          className="transition-transform"
          color="default"
          size="sm"
          src={avatarSrc}
        />
      </DropdownTrigger>

      <DropdownMenu aria-label="Profile Actions" variant="flat">
        {menuItems}
      </DropdownMenu>
    </Dropdown>
  );
};

export default NavbarDropDownMenu;
