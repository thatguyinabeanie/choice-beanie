"use client";

import {
  Table,
  TableHeader,
  TableBody,
  TableColumn,
  TableRow,
  TableCell,
} from "@nextui-org/react";
import React from "react";

import { title } from "@/components/primitives";
import { Organization, OrganizationsService } from "@/api/requests";


const useOrganizations = () => {
  const [organizations, setOrganizations] = React.useState<Organization[]>([]);

  React.useEffect(() => {
    const fetchOrganizations = async () => {
      const orgs: Organization[] = (await OrganizationsService.listOrganizations()).body;

      console.log(orgs);
      setOrganizations(orgs);
    };

    fetchOrganizations();
  }, []);

  return organizations;
};

export default function OrganizationsPage () {
  const organizations = useOrganizations();

  return (
    <div>
      <h1 className={ title() }>Organizations</h1>

      <Table aria-label="Example table with dynamic content">
        <TableHeader>
          <TableColumn>ID</TableColumn>
          <TableColumn>Name</TableColumn>
          <TableColumn>Location</TableColumn>
        </TableHeader>
        <TableBody>
          { organizations.map((org) => (
            <TableRow key={ org.id }>
              <TableCell>{ org.id }</TableCell>
              <TableCell>{ org.name }</TableCell>
              <TableCell>{ org.owner.username }</TableCell>
            </TableRow>
          )) }
        </TableBody>
      </Table>
    </div>
  );
}
