// Run: SUPABASE_URL=... ANON_KEY=... A_EMAIL=... A_PASS=... B_EMAIL=... B_PASS=... node tests/rls.mjs
import {createClient} from '@supabase/supabase-js';
const url=process.env.SUPABASE_URL, anon=process.env.ANON_KEY;
if(!url||!anon){console.log('SKIP: set SUPABASE_URL/ANON_KEY');process.exit(0)}
const mk=()=>createClient(url,anon,{db:{schema:'salespro'}});
const anonC=mk(); const {data:ad,error:ae}=await anonC.from('products').select('*');
console.log('anon read (expect error/0):',ae?ae.message:(ad||[]).length);
if(process.env.A_EMAIL&&process.env.B_EMAIL){const A=mk(),B=mk();await A.auth.signInWithPassword({email:process.env.A_EMAIL,password:process.env.A_PASS});await B.auth.signInWithPassword({email:process.env.B_EMAIL,password:process.env.B_PASS});const{data:bp}=await B.from('products').select('*');const{data:ap}=await A.from('products').select('*');console.log('A:',(ap||[]).length,'B sees:',(bp||[]).length,'(B must not include A-only rows)')}
console.log('rls done');