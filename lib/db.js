import { neon } from '@neondatabase/serverless';
import { drizzle } from 'drizzle-orm/neon-http';
import { sql } from 'drizzle-orm';
export { sql };
export function database(){if(!process.env.DATABASE_URL)throw new Error('Database not configured');return drizzle(neon(process.env.DATABASE_URL));}
export function rows(r){return r.rows||r;}
