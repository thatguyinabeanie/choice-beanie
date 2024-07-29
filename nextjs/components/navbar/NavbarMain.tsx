import {
  Navbar as NextUINavbar,
  NavbarContent,
  NavbarMenu,
  NavbarMenuToggle,
  NavbarItem,
  NavbarMenuItem,
} from "@nextui-org/navbar";
import { Button } from "@nextui-org/button";
import { Link } from "@nextui-org/link";

import { siteConfig } from "@/config/site";
import { ThemeSwitch } from "@/components/theme-switch";
import {
  TwitterIcon,
  GithubIcon,
  DiscordIcon,
  HeartFilledIcon
} from "@/components/icons";
import { NavbarBrandComponent } from "./NavbarBrand";
import { NavbarSiteList } from "./NavbarSiteList";
import { NavbarSearch } from "./NavbarSearch";

export const NavbarMain = () => {

  return (
    <NextUINavbar maxWidth="xl" position="sticky">

      <NavbarContent className="basis-1/5 sm:basis-full" justify="start">
        <NavbarBrandComponent />
        <NavbarSiteList />
      </NavbarContent>

      <NavbarContent
        className="hidden sm:flex basis-1/5 sm:basis-full"
        justify="end"
      >
        <NavbarItem className="hidden sm:flex gap-2">
          <Link isExternal aria-label="Twitter" href={ siteConfig.links.twitter }>
            <TwitterIcon className="text-default-500" />
          </Link>
          <Link isExternal aria-label="Discord" href={ siteConfig.links.discord }>
            <DiscordIcon className="text-default-500" />
          </Link>
          <Link isExternal aria-label="Github" href={ siteConfig.links.github }>
            <GithubIcon className="text-default-500" />
          </Link>
          <ThemeSwitch />
        </NavbarItem>

        <NavbarItem className="hidden lg:flex">
          <NavbarSearch />
        </NavbarItem>

        <NavbarItem className="hidden md:flex">
          <Button
            isExternal
            as={ Link }
            className="text-sm font-normal text-default-600 bg-default-100"
            href={ siteConfig.links.sponsor }
            startContent={ <HeartFilledIcon className="text-danger" /> }
            variant="flat"
          >
            Sponsor
          </Button>
        </NavbarItem>
      </NavbarContent>

      <NavbarContent className="sm:hidden basis-1 pl-4" justify="end">
        <Link isExternal aria-label="Github" href={ siteConfig.links.github }>
          <GithubIcon className="text-default-500" />
        </Link>
        <ThemeSwitch />
        <NavbarMenuToggle />
      </NavbarContent>

      <NavbarMenuToggle />

      <NavbarMenu>
        {/* <NavbarSearch /> */ }
        <div className="mx-4 mt-2 flex flex-col gap-2">
          { siteConfig.navMenuItems.map((item, index) => (
            <NavbarMenuItem key={ `${item}-${index}` }>
              <Link
                color={
                  index === 2
                    ? "primary"
                    : index === siteConfig.navMenuItems.length - 1
                      ? "danger"
                      : "foreground"
                }
                href="#"
                size="lg"
              >
                { item.label }
              </Link>
            </NavbarMenuItem>
          )) }
        </div>
      </NavbarMenu>
    </NextUINavbar>
  );
};
