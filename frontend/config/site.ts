export type SiteConfig = typeof siteConfig;

export const siteConfig = {
  name: "Next.js + NextUI",
  description: "Make beautiful websites regardless of your design experience.",
  navItems: [
    {
      label: "Organizations",
      href: "/organizations",
    },
    {
      label: "Tournaments",
      href: "/tournaments",
    }

  ],
  navMenuItems: [
    {
      label: "Settings",
      href: "/settings",
    },
    {
      label: "Help & Feedback",
      href: "/help-feedback",
    },
    {
      label: "Logout",
      href: "/logout",
    },
  ],
  links: {
    github: "https://github.com/thatguyinabeanie/battle-stadium",
    twitter: "https://twitter.com/thatguyinabeani",
    docs: "https://nextui.org",
    // discord: "https://discord.gg/9b6yyZKmH4",
    sponsor: "https://patreon.com/jrgarciadev",
  },
};
