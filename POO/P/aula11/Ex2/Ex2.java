package Ex2;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;



public class Ex2 {
	
	public static void main (String[] arg) throws IOException, Exception{
		TreeMap <Hora, HashSet<ArrayList<String>>> voos = new TreeMap<>();	//Hora={n*{códigoVoo, origem, atraso, horaPrevistaChegada}}, sendo n o número de voos nessa hora
		HashMap <String, ArrayList<Object>> companhias = new HashMap<>();	//Sigla={nome, numeroDeVoosCAtraso, somaAtrasos}
		HashMap<String, Integer> cidades = new HashMap<>(); //cidades={cidade=int}
		
		//Ler companhias
		try(Scanner inputCompanhias = new Scanner(new FileReader("companhias.txt"))) {
			//Saltar cabeçalho
			inputCompanhias.nextLine();
			//Processar restante documento
			while(inputCompanhias.hasNext()) {
				String[] data= inputCompanhias.nextLine().split("\\t"); //data=[sigla, nome]
				//Valor
				ArrayList<Object> valor = new ArrayList<Object>(); //valor={}
				valor.add(data[1]); //valor={nome}
				valor.add(0); //valor={nome, numeroDeVoosCAtraso}
				valor.add(Hora.getHora("00:00")); //valor={nome, numeroDeVoosCAtraso, somaAtrasos}
				valor.add(Hora.getHora("00:00")); //valor={nome, numeroDeVoosCAtraso, somaAtrasos, mediaAtraso}
				//Adicionar par chave/valor
				companhias.put(data[0].trim(), valor);
			}
			inputCompanhias.close();
		}catch(IOException e) {
			System.err.printf("ERRO: %s\n", e.getMessage());
		}/*catch(Exception e) {
			System.err.printf("ERRO: %s\n", e.getMessage());
		}*/
		
		//Ler voos
		try(Scanner inputVoos = new Scanner(new FileReader("voos.txt"))) {
			//Saltar cabeçalho:	Hora	Voo	Origem	Atraso
			inputVoos.nextLine();
			//Processar restante documento
			while(inputVoos.hasNext()) {
				String[] data= inputVoos.nextLine().split("\\t"); //data=[Hora, Voo, Origem, Atraso]
				//Definir chave (hora)
				Hora h;
				var ht = data[0].split(":");
				h = new Hora(Integer.parseInt(ht[0]), Integer.parseInt(ht[1]));
				//Definir valor (restantes dados)
				ArrayList<String> outros = new ArrayList<String>(); //outros={}
				for(int n=1; n<data.length; n++) { 
					outros.add(data[n]); //outros={Voo, Origem, Atraso(caso exista)}
				}
				//Registar cidade
				String cidade = outros.get(1);
				int c = 1;
				if(cidades.containsKey(cidade)) {
					c+=cidades.get(cidade);
				}
				cidades.put(cidade, c);
				//Registar atrasos
				if(outros.size()==2) {
					//Caso não haja atraso
					outros.add("00:00"); //outros={Voo, Origem, Atraso}
				} else { //Caso haja atraso, adicionar ao registo da companhia, caso exista
					//Verificar se companhia existe (ZY das 17:30 não está na lista)
					String ciaCode = outros.get(0).substring(0, 2); //ciaCode = XX
					boolean companhiaExists = companhias.containsKey(ciaCode);
					if(companhiaExists) { //Só adiciona atraso se companhia existir
						ArrayList<Object> dadosCompanhia = companhias.get(ciaCode); //dadosCompanhia={nome, numeroDeVoosCAtraso, somaAtrasos, mediaAtraso}
						int voosAtraso = Integer.parseInt(dadosCompanhia.get(1).toString())+1;
						dadosCompanhia.set(1, voosAtraso);
						Hora tempoAtraso = Hora.getHora(dadosCompanhia.get(2).toString());
						tempoAtraso.add(outros.get(2));
						dadosCompanhia.set(2, tempoAtraso);
						int minAtraso = tempoAtraso.hashCode();
						int mediaAtraso = minAtraso/voosAtraso;
						dadosCompanhia.set(3, new Hora(mediaAtraso));
					}
				}
				outros.add(h.calcularSoma(outros.get(2)).toString()); //Adicionar hora prevista de chegada c atraso
				HashSet<ArrayList<String>> valor = new HashSet<ArrayList<String>>();
				valor.add(outros);
				//Adicionar par chave/valor
				voos.put(h, valor);
			}
			inputVoos.close();
		}catch(IOException e) {
			System.err.printf("ERRO: %s\n", e.getMessage());
		}
		
		//a) e b)
		try(PrintWriter fileInfoPublico = new PrintWriter(new File("Infopublico.txt"))){
			System.out.println("a)\n");
			System.out.printf("%-7s%-10s%-20s%-25s%-8s%-20s\n", "Hora", "Voo", "Companhia", "Origem", "Atraso", "Obs");
			fileInfoPublico.printf("%-7s%-10s%-20s%-25s%-8s%-20s\n", "Hora", "Voo", "Companhia", "Origem", "Atraso", "Obs");
			for(Hora h:voos.keySet()) {
				HashSet<ArrayList<String>> dataVoos = voos.get(h);
				Iterator<ArrayList<String>> itt = dataVoos.iterator();
				while (itt.hasNext()) {
					ArrayList<String> vooData = itt.next();
					//Verificar se companhia existe (ZY das 17:30 não está na lista)
					String ciaCode = vooData.get(0).substring(0, 2).trim();
					boolean companhiaExists = companhias.containsKey(ciaCode);
					String companhia=ciaCode;
					if(companhiaExists) {
						companhia=companhias.get(ciaCode).get(0).toString();
					}
					System.out.printf("%-7s%-10s%-20s%-25s", h.toString(), vooData.get(0) , companhia, vooData.get(1));
					fileInfoPublico.printf("%-7s%-10s%-20s%-25s", h.toString(), vooData.get(0) , companhia, vooData.get(1));
					if(vooData.get(2)!="00:00") {
						//Caso haja atraso
						System.out.printf("%-8s", vooData.get(2)); //Atraso
						System.out.printf("Previsto: %-8s", vooData.get(3)); //obs
						fileInfoPublico.printf("%-8s", vooData.get(2)); //Atraso
						fileInfoPublico.printf("Previsto: %-8s", vooData.get(3)); //obs
					}
					System.out.println("");
					fileInfoPublico.println("");
				}
			}			
			fileInfoPublico.close();
			System.out.println("\n\nb)\n");
			System.out.println("Infopublico.txt criado com sucesso no seguinte diretório: src/aula11/Ex2");
		}catch(IOException e) {
			System.err.printf("ERRO: %s\n", e.getMessage());
		}
		
	}
}
